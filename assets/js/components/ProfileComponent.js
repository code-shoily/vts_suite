import React from "react";
import { inject, observer } from "mobx-react";
import { Avatar } from "antd";
import { compose } from "recompose";
import { StyleSheet, css } from "aphrodite";
import { FLAT_COLORS } from "../config/constants";

const styles = StyleSheet.create({
  profileCard: {
    width: "100%",
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
    textAlign: "center",
    color: FLAT_COLORS.silver,
    lineHeight: 2,
    paddingTop: 20,
    paddingBottom: 20
  },
  username: {
    paddingTop: 5,
    fontSize: "larger"
  },
  email: {
    fontStyle: "italic"
  },
  avatar: {
    color: FLAT_COLORS.clouds,
    backgroundColor: FLAT_COLORS.carrot
  }
});

const ProfileComponent = ({ store }) => (
  <div className={css(styles.profileCard)}>
    {store.user && store.user.initials() !== "" ? (
      <Avatar className={css(styles.avatar)}>{store.user.initials()}</Avatar>
    ) : (
      <Avatar icon="user" className={css(styles.avatar)} />
    )}
    {store.user ? (
      <div className={css(styles.username)}>
        {store.user.firstName + " " + store.user.lastName}
      </div>
    ) : null}
    {store.user && store.user.email ? (
      <div className={css(styles.email)}>{store.user.email}</div>
    ) : null}
  </div>
);

export default compose(inject("store"), observer)(ProfileComponent);
