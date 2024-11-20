module TD.Query.ReuseStarSubscription
  (ReuseStarSubscription(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Reuses an active Telegram Star subscription to a channel chat and joins the chat again. Returns 'TD.Data.Ok.Ok'
data ReuseStarSubscription
  = ReuseStarSubscription
    { subscription_id :: Maybe T.Text -- ^ Identifier of the subscription
    }
  deriving (Eq, Show)

instance I.ShortShow ReuseStarSubscription where
  shortShow
    ReuseStarSubscription
      { subscription_id = subscription_id_
      }
        = "ReuseStarSubscription"
          ++ I.cc
          [ "subscription_id" `I.p` subscription_id_
          ]

instance AT.ToJSON ReuseStarSubscription where
  toJSON
    ReuseStarSubscription
      { subscription_id = subscription_id_
      }
        = A.object
          [ "@type"           A..= AT.String "reuseStarSubscription"
          , "subscription_id" A..= subscription_id_
          ]

