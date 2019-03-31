module CreditCardHelper
  def get_credit_log(bland)
    bland_dic = {
      visa:      '//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?4136293187',
      master:    '//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?4136293187',
      saison:    '//www-mercari-jp.akamaized.net/assets/img/card/saison-card.svg?4136293187',
      jcb:       '//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?4136293187',
      american:  '//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?4136293187',
      dinners:   '//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?4136293187',
      discover:  '//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?4136293187',
    }
    return image_tag(bland_dic[bland], class:bland.to_s)
  end
end
