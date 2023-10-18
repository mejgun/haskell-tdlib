module TD.Query.GetRecentlyVisitedTMeUrls
  (GetRecentlyVisitedTMeUrls(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns t.me URLs recently visited by a newly registered user. Returns 'TD.Data.TMeUrls.TMeUrls'
data GetRecentlyVisitedTMeUrls
  = GetRecentlyVisitedTMeUrls
    { referrer :: Maybe T.Text -- ^ Google Play referrer to identify the user
    }
  deriving (Eq, Show)

instance I.ShortShow GetRecentlyVisitedTMeUrls where
  shortShow
    GetRecentlyVisitedTMeUrls
      { referrer = referrer_
      }
        = "GetRecentlyVisitedTMeUrls"
          ++ I.cc
          [ "referrer" `I.p` referrer_
          ]

instance AT.ToJSON GetRecentlyVisitedTMeUrls where
  toJSON
    GetRecentlyVisitedTMeUrls
      { referrer = referrer_
      }
        = A.object
          [ "@type"    A..= AT.String "getRecentlyVisitedTMeUrls"
          , "referrer" A..= referrer_
          ]

