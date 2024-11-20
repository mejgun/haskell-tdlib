module TD.Query.EditUserStarSubscription
  (EditUserStarSubscription(..)
  , defaultEditUserStarSubscription
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Cancels or re-enables Telegram Star subscription for a user; for bots only. Returns 'TD.Data.Ok.Ok'
data EditUserStarSubscription
  = EditUserStarSubscription
    { user_id                    :: Maybe Int    -- ^ User identifier
    , telegram_payment_charge_id :: Maybe T.Text -- ^ Telegram payment identifier of the subscription
    , is_canceled                :: Maybe Bool   -- ^ Pass true to cancel the subscription; pass false to allow the user to enable it
    }
  deriving (Eq, Show)

instance I.ShortShow EditUserStarSubscription where
  shortShow
    EditUserStarSubscription
      { user_id                    = user_id_
      , telegram_payment_charge_id = telegram_payment_charge_id_
      , is_canceled                = is_canceled_
      }
        = "EditUserStarSubscription"
          ++ I.cc
          [ "user_id"                    `I.p` user_id_
          , "telegram_payment_charge_id" `I.p` telegram_payment_charge_id_
          , "is_canceled"                `I.p` is_canceled_
          ]

instance AT.ToJSON EditUserStarSubscription where
  toJSON
    EditUserStarSubscription
      { user_id                    = user_id_
      , telegram_payment_charge_id = telegram_payment_charge_id_
      , is_canceled                = is_canceled_
      }
        = A.object
          [ "@type"                      A..= AT.String "editUserStarSubscription"
          , "user_id"                    A..= user_id_
          , "telegram_payment_charge_id" A..= telegram_payment_charge_id_
          , "is_canceled"                A..= is_canceled_
          ]

defaultEditUserStarSubscription :: EditUserStarSubscription
defaultEditUserStarSubscription =
  EditUserStarSubscription
    { user_id                    = Nothing
    , telegram_payment_charge_id = Nothing
    , is_canceled                = Nothing
    }

