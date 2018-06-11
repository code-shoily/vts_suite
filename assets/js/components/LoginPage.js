import React from "react";
import { observer, inject } from "mobx-react";
import { compose, lifecycle } from "recompose";

import { StyleSheet, css } from "aphrodite";
import {
  Layout,
  Col,
  Divider,
  Card,
  Form,
  Icon,
  Input,
  Button,
  Spin,
  Alert
} from "antd";
import { FLAT_COLORS } from "../config/constants";

const style = StyleSheet.create({
  root: {
    display: "flex",
    background: FLAT_COLORS.silver,
    alignItems: "center",
    justifyContent: "center",
    height: "100vh",
    width: "100vw"
  },
  rightAligned: {
    textAlign: "right"
  },
  leftMargined: {
    marginLeft: 8
  }
});

function hasErrors(fieldsError) {
  return Object.keys(fieldsError).some(field => fieldsError[field]);
}

const LoginPage = ({ store, form }) => {
  const FormItem = Form.Item;
  const {
    getFieldDecorator,
    getFieldsError,
    getFieldError,
    getFieldValue,
    isFieldTouched
  } = form;
  const userNameError = isFieldTouched("userName") && getFieldError("userName");
  const passwordError = isFieldTouched("password") && getFieldError("password");

  const serverError = errors => {
    return errors.length > 0 ? (
      <Form.Item>
        {errors.map((err, idx) => (
          <Alert key={idx} message={err} type="error" showIcon closable />
        ))}
      </Form.Item>
    ) : null;
  };

  const clearForm = () => {
    form.resetFields();
    store.auth.clearCredentials();
  };
  return (
    <Layout>
      <Layout.Content className={css(style.root)}>
        <Col lg={12} xs={23}>
          <Card
            title="Welcome to Vehicle Tracking System v2"
            extra={store.loadingFlags.isLoggingIn ? <Spin /> : null}
          >
            <Form>
              {serverError(store.auth.errors)}
              <FormItem
                validateStatus={userNameError ? "error" : ""}
                help={userNameError || ""}
              >
                {getFieldDecorator("userName", {
                  rules: [
                    { required: true, message: "Please input your username!" }
                  ]
                })(
                  <Input
                    prefix={
                      <Icon type="user" style={{ color: "rgba(0,0,0,.25)" }} />
                    }
                    placeholder="Username"
                  />
                )}
              </FormItem>
              <FormItem
                validateStatus={passwordError ? "error" : ""}
                help={passwordError || ""}
              >
                {getFieldDecorator("password", {
                  rules: [
                    { required: true, message: "Please input your Password!" }
                  ]
                })(
                  <Input
                    prefix={
                      <Icon type="lock" style={{ color: "rgba(0,0,0,.25)" }} />
                    }
                    type="password"
                    placeholder="Password"
                  />
                )}
              </FormItem>
              <Divider />
              <FormItem className={css(style.rightAligned)}>
                <Button
                  type="primary"
                  icon="poweroff"
                  disabled={hasErrors(getFieldsError())}
                  htmlType="submit"
                  onClick={() =>
                    store.auth.login(
                      getFieldValue("userName"),
                      getFieldValue("password")
                    )
                  }
                >
                  Log in
                </Button>
                <Button
                  icon="close"
                  className={css(style.leftMargined)}
                  onClick={clearForm}
                >
                  Clear
                </Button>
              </FormItem>
            </Form>
          </Card>
        </Col>
      </Layout.Content>
    </Layout>
  );
};

export default compose(
  inject("store"),
  Form.create(),
  lifecycle({
    componentDidMount() {
      this.props.form.validateFields();
    }
  }),
  observer
)(LoginPage);
