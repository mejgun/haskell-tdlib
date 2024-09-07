module TD.Query.GetGrossingWebAppBots
  (GetGrossingWebAppBots(..)
  , defaultGetGrossingWebAppBots
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the most grossing Web App bots. Returns 'TD.Data.FoundUsers.FoundUsers'
data GetGrossingWebAppBots
  = GetGrossingWebAppBots
    { offset :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit  :: Maybe Int    -- ^ The maximum number of bots to be returned; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow GetGrossingWebAppBots where
  shortShow
    GetGrossingWebAppBots
      { offset = offset_
      , limit  = limit_
      }
        = "GetGrossingWebAppBots"
          ++ I.cc
          [ "offset" `I.p` offset_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON GetGrossingWebAppBots where
  toJSON
    GetGrossingWebAppBots
      { offset = offset_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "getGrossingWebAppBots"
          , "offset" A..= offset_
          , "limit"  A..= limit_
          ]

defaultGetGrossingWebAppBots :: GetGrossingWebAppBots
defaultGetGrossingWebAppBots =
  GetGrossingWebAppBots
    { offset = Nothing
    , limit  = Nothing
    }

