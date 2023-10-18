module TD.Query.SetUserSupportInfo
  (SetUserSupportInfo(..)
  , defaultSetUserSupportInfo
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Sets support information for the given user; for Telegram support only. Returns 'TD.Data.UserSupportInfo.UserSupportInfo'
data SetUserSupportInfo
  = SetUserSupportInfo
    { user_id :: Maybe Int                         -- ^ User identifier
    , message :: Maybe FormattedText.FormattedText -- ^ New information message
    }
  deriving (Eq, Show)

instance I.ShortShow SetUserSupportInfo where
  shortShow
    SetUserSupportInfo
      { user_id = user_id_
      , message = message_
      }
        = "SetUserSupportInfo"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "message" `I.p` message_
          ]

instance AT.ToJSON SetUserSupportInfo where
  toJSON
    SetUserSupportInfo
      { user_id = user_id_
      , message = message_
      }
        = A.object
          [ "@type"   A..= AT.String "setUserSupportInfo"
          , "user_id" A..= user_id_
          , "message" A..= message_
          ]

defaultSetUserSupportInfo :: SetUserSupportInfo
defaultSetUserSupportInfo =
  SetUserSupportInfo
    { user_id = Nothing
    , message = Nothing
    }

