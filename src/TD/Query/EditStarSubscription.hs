module TD.Query.EditStarSubscription
  (EditStarSubscription(..)
  , defaultEditStarSubscription
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Cancels or re-enables Telegram Star subscription. Returns 'TD.Data.Ok.Ok'
data EditStarSubscription
  = EditStarSubscription
    { subscription_id :: Maybe T.Text -- ^ Identifier of the subscription to change
    , is_canceled     :: Maybe Bool   -- ^ New value of is_canceled
    }
  deriving (Eq, Show)

instance I.ShortShow EditStarSubscription where
  shortShow
    EditStarSubscription
      { subscription_id = subscription_id_
      , is_canceled     = is_canceled_
      }
        = "EditStarSubscription"
          ++ I.cc
          [ "subscription_id" `I.p` subscription_id_
          , "is_canceled"     `I.p` is_canceled_
          ]

instance AT.ToJSON EditStarSubscription where
  toJSON
    EditStarSubscription
      { subscription_id = subscription_id_
      , is_canceled     = is_canceled_
      }
        = A.object
          [ "@type"           A..= AT.String "editStarSubscription"
          , "subscription_id" A..= subscription_id_
          , "is_canceled"     A..= is_canceled_
          ]

defaultEditStarSubscription :: EditStarSubscription
defaultEditStarSubscription =
  EditStarSubscription
    { subscription_id = Nothing
    , is_canceled     = Nothing
    }

