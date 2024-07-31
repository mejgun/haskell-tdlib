module TD.Query.GetPopularWebAppBots
  (GetPopularWebAppBots(..)
  , defaultGetPopularWebAppBots
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns popular Web App bots. Returns 'TD.Data.FoundUsers.FoundUsers'
data GetPopularWebAppBots
  = GetPopularWebAppBots
    { offset :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit  :: Maybe Int    -- ^ The maximum number of bots to be returned; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow GetPopularWebAppBots where
  shortShow
    GetPopularWebAppBots
      { offset = offset_
      , limit  = limit_
      }
        = "GetPopularWebAppBots"
          ++ I.cc
          [ "offset" `I.p` offset_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON GetPopularWebAppBots where
  toJSON
    GetPopularWebAppBots
      { offset = offset_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "getPopularWebAppBots"
          , "offset" A..= offset_
          , "limit"  A..= limit_
          ]

defaultGetPopularWebAppBots :: GetPopularWebAppBots
defaultGetPopularWebAppBots =
  GetPopularWebAppBots
    { offset = Nothing
    , limit  = Nothing
    }

