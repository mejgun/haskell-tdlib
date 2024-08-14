module TD.Query.GetStarSubscriptions
  (GetStarSubscriptions(..)
  , defaultGetStarSubscriptions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the list of Telegram Star subscriptions for the current user. Returns 'TD.Data.StarSubscriptions.StarSubscriptions'
data GetStarSubscriptions
  = GetStarSubscriptions
    { only_expiring :: Maybe Bool   -- ^ Pass true to receive only expiring subscriptions for which there are no enough Telegram Stars to extend
    , offset        :: Maybe T.Text -- ^ Offset of the first subscription to return as received from the previous request; use empty string to get the first chunk of results
    }
  deriving (Eq, Show)

instance I.ShortShow GetStarSubscriptions where
  shortShow
    GetStarSubscriptions
      { only_expiring = only_expiring_
      , offset        = offset_
      }
        = "GetStarSubscriptions"
          ++ I.cc
          [ "only_expiring" `I.p` only_expiring_
          , "offset"        `I.p` offset_
          ]

instance AT.ToJSON GetStarSubscriptions where
  toJSON
    GetStarSubscriptions
      { only_expiring = only_expiring_
      , offset        = offset_
      }
        = A.object
          [ "@type"         A..= AT.String "getStarSubscriptions"
          , "only_expiring" A..= only_expiring_
          , "offset"        A..= offset_
          ]

defaultGetStarSubscriptions :: GetStarSubscriptions
defaultGetStarSubscriptions =
  GetStarSubscriptions
    { only_expiring = Nothing
    , offset        = Nothing
    }

