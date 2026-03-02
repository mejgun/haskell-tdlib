module TD.Query.CheckOauthRequestMatchCode
  (CheckOauthRequestMatchCode(..)
  , defaultCheckOauthRequestMatchCode
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks a match-code for an OAuth authorization request. If fails, then the authorization request has failed. Otherwise, authorization confirmation dialog must be shown and the link must be processed using acceptOauthRequest or declineOauthRequest. Returns 'TD.Data.Ok.Ok'
data CheckOauthRequestMatchCode
  = CheckOauthRequestMatchCode
    { url        :: Maybe T.Text -- ^ URL of the OAuth deep link
    , match_code :: Maybe T.Text -- ^ The matching code chosen by the user
    }
  deriving (Eq, Show)

instance I.ShortShow CheckOauthRequestMatchCode where
  shortShow
    CheckOauthRequestMatchCode
      { url        = url_
      , match_code = match_code_
      }
        = "CheckOauthRequestMatchCode"
          ++ I.cc
          [ "url"        `I.p` url_
          , "match_code" `I.p` match_code_
          ]

instance AT.ToJSON CheckOauthRequestMatchCode where
  toJSON
    CheckOauthRequestMatchCode
      { url        = url_
      , match_code = match_code_
      }
        = A.object
          [ "@type"      A..= AT.String "checkOauthRequestMatchCode"
          , "url"        A..= url_
          , "match_code" A..= match_code_
          ]

defaultCheckOauthRequestMatchCode :: CheckOauthRequestMatchCode
defaultCheckOauthRequestMatchCode =
  CheckOauthRequestMatchCode
    { url        = Nothing
    , match_code = Nothing
    }

