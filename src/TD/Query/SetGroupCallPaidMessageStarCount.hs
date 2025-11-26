module TD.Query.SetGroupCallPaidMessageStarCount
  (SetGroupCallPaidMessageStarCount(..)
  , defaultSetGroupCallPaidMessageStarCount
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the minimum number of Telegram Stars that must be paid by general participant for each sent message to a live story call. Requires groupCall.can_be_managed right. Returns 'TD.Data.Ok.Ok'
data SetGroupCallPaidMessageStarCount
  = SetGroupCallPaidMessageStarCount
    { group_call_id           :: Maybe Int -- ^ Group call identifier; must be an identifier of a live story call
    , paid_message_star_count :: Maybe Int -- ^ The new minimum number of Telegram Stars; 0-getOption("paid_group_call_message_star_count_max")
    }
  deriving (Eq, Show)

instance I.ShortShow SetGroupCallPaidMessageStarCount where
  shortShow
    SetGroupCallPaidMessageStarCount
      { group_call_id           = group_call_id_
      , paid_message_star_count = paid_message_star_count_
      }
        = "SetGroupCallPaidMessageStarCount"
          ++ I.cc
          [ "group_call_id"           `I.p` group_call_id_
          , "paid_message_star_count" `I.p` paid_message_star_count_
          ]

instance AT.ToJSON SetGroupCallPaidMessageStarCount where
  toJSON
    SetGroupCallPaidMessageStarCount
      { group_call_id           = group_call_id_
      , paid_message_star_count = paid_message_star_count_
      }
        = A.object
          [ "@type"                   A..= AT.String "setGroupCallPaidMessageStarCount"
          , "group_call_id"           A..= group_call_id_
          , "paid_message_star_count" A..= paid_message_star_count_
          ]

defaultSetGroupCallPaidMessageStarCount :: SetGroupCallPaidMessageStarCount
defaultSetGroupCallPaidMessageStarCount =
  SetGroupCallPaidMessageStarCount
    { group_call_id           = Nothing
    , paid_message_star_count = Nothing
    }

