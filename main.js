/**
 * Created by nicolas.couet on 03/04/2015.
 */

truc = require('./UniPort.js');
a = require('./ABaseEntity.js')

var b = a.ABaseEntity();

b.listAction();

var port = truc.UniPort();

port.listAction();
