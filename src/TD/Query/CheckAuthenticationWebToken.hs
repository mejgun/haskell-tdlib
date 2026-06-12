module TD.Query.CheckAuthenticationWebToken
  (CheckAuthenticationWebToken(..)
  , defaultCheckAuthenticationWebToken
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks a web token to log in to the corresponding account; for official Telegram apps only. Works only when the current authorization state is authorizationStateWaitPhoneNumber or authorizationStateWaitOtherDeviceConfirmation. Returns 'TD.Data.Ok.Ok'
data CheckAuthenticationWebToken
  = CheckAuthenticationWebToken
    { token :: Maybe T.Text -- ^ The token to check
    , dc_id :: Maybe Int    -- ^ Identifier of the datacenter of the user
    }
  deriving (Eq, Show)

instance I.ShortShow CheckAuthenticationWebToken where
  shortShow
    CheckAuthenticationWebToken
      { token = token_
      , dc_id = dc_id_
      }
        = "CheckAuthenticationWebToken"
          ++ I.cc
          [ "token" `I.p` token_
          , "dc_id" `I.p` dc_id_
          ]

instance AT.ToJSON CheckAuthenticationWebToken where
  toJSON
    CheckAuthenticationWebToken
      { token = token_
      , dc_id = dc_id_
      }
        = A.object
          [ "@type" A..= AT.String "checkAuthenticationWebToken"
          , "token" A..= token_
          , "dc_id" A..= dc_id_
          ]

defaultCheckAuthenticationWebToken :: CheckAuthenticationWebToken
defaultCheckAuthenticationWebToken =
  CheckAuthenticationWebToken
    { token = Nothing
    , dc_id = Nothing
    }

