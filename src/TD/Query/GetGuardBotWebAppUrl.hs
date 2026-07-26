module TD.Query.GetGuardBotWebAppUrl
  (GetGuardBotWebAppUrl(..)
  , defaultGetGuardBotWebAppUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.WebAppOpenParameters as WebAppOpenParameters

-- | Returns an HTTPS URL of a Web App of a guard bot to open after receiving chatJoinResultGuardBotApprovalRequired. Returns 'TD.Data.WebAppUrl.WebAppUrl'
data GetGuardBotWebAppUrl
  = GetGuardBotWebAppUrl
    { query_id   :: Maybe Int                                       -- ^ Unique identifier of the join request as received in chatJoinResultGuardBotApprovalRequired
    , parameters :: Maybe WebAppOpenParameters.WebAppOpenParameters -- ^ Parameters to use to open the Web App
    }
  deriving (Eq, Show)

instance I.ShortShow GetGuardBotWebAppUrl where
  shortShow
    GetGuardBotWebAppUrl
      { query_id   = query_id_
      , parameters = parameters_
      }
        = "GetGuardBotWebAppUrl"
          ++ I.cc
          [ "query_id"   `I.p` query_id_
          , "parameters" `I.p` parameters_
          ]

instance AT.ToJSON GetGuardBotWebAppUrl where
  toJSON
    GetGuardBotWebAppUrl
      { query_id   = query_id_
      , parameters = parameters_
      }
        = A.object
          [ "@type"      A..= AT.String "getGuardBotWebAppUrl"
          , "query_id"   A..= fmap I.writeInt64  query_id_
          , "parameters" A..= parameters_
          ]

defaultGetGuardBotWebAppUrl :: GetGuardBotWebAppUrl
defaultGetGuardBotWebAppUrl =
  GetGuardBotWebAppUrl
    { query_id   = Nothing
    , parameters = Nothing
    }

