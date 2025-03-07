module TD.Query.AllowUnpaidMessagesFromUser
  (AllowUnpaidMessagesFromUser(..)
  , defaultAllowUnpaidMessagesFromUser
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Allows the specified user to send unpaid private messages to the current user by adding a rule to userPrivacySettingAllowUnpaidMessages. Returns 'TD.Data.Ok.Ok'
data AllowUnpaidMessagesFromUser
  = AllowUnpaidMessagesFromUser
    { user_id         :: Maybe Int  -- ^ Identifier of the user
    , refund_payments :: Maybe Bool -- ^ Pass true to refund the user previously paid messages
    }
  deriving (Eq, Show)

instance I.ShortShow AllowUnpaidMessagesFromUser where
  shortShow
    AllowUnpaidMessagesFromUser
      { user_id         = user_id_
      , refund_payments = refund_payments_
      }
        = "AllowUnpaidMessagesFromUser"
          ++ I.cc
          [ "user_id"         `I.p` user_id_
          , "refund_payments" `I.p` refund_payments_
          ]

instance AT.ToJSON AllowUnpaidMessagesFromUser where
  toJSON
    AllowUnpaidMessagesFromUser
      { user_id         = user_id_
      , refund_payments = refund_payments_
      }
        = A.object
          [ "@type"           A..= AT.String "allowUnpaidMessagesFromUser"
          , "user_id"         A..= user_id_
          , "refund_payments" A..= refund_payments_
          ]

defaultAllowUnpaidMessagesFromUser :: AllowUnpaidMessagesFromUser
defaultAllowUnpaidMessagesFromUser =
  AllowUnpaidMessagesFromUser
    { user_id         = Nothing
    , refund_payments = Nothing
    }

