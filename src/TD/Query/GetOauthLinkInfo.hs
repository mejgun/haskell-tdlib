module TD.Query.GetOauthLinkInfo
  (GetOauthLinkInfo(..)
  , defaultGetOauthLinkInfo
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about an OAuth deep link. Use checkOauthRequestMatchCode, acceptOauthRequest or declineOauthRequest to process the link. Returns 'TD.Data.OauthLinkInfo.OauthLinkInfo'
data GetOauthLinkInfo
  = GetOauthLinkInfo
    { url           :: Maybe T.Text -- ^ URL of the link
    , in_app_origin :: Maybe T.Text -- ^ Origin of the OAuth request if the request was received from the in-app browser; pass an empty string otherwise
    }
  deriving (Eq, Show)

instance I.ShortShow GetOauthLinkInfo where
  shortShow
    GetOauthLinkInfo
      { url           = url_
      , in_app_origin = in_app_origin_
      }
        = "GetOauthLinkInfo"
          ++ I.cc
          [ "url"           `I.p` url_
          , "in_app_origin" `I.p` in_app_origin_
          ]

instance AT.ToJSON GetOauthLinkInfo where
  toJSON
    GetOauthLinkInfo
      { url           = url_
      , in_app_origin = in_app_origin_
      }
        = A.object
          [ "@type"         A..= AT.String "getOauthLinkInfo"
          , "url"           A..= url_
          , "in_app_origin" A..= in_app_origin_
          ]

defaultGetOauthLinkInfo :: GetOauthLinkInfo
defaultGetOauthLinkInfo =
  GetOauthLinkInfo
    { url           = Nothing
    , in_app_origin = Nothing
    }

