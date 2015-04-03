/**
 * Created by nicolas.couet on 03/04/2015.
 */


exports.KeyPass = function (keypass) {
    ABaseEntity.prototype.keypass = keypass;

    ABaseEntity.prototype.checkPass = function (keypass) {
        if (keypass === this.keypass)
            return true;
        return false;
    }
}