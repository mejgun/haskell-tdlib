module TD.Query.GetUserSupportInfo
  (GetUserSupportInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns support information for the given user; for Telegram support only. Returns 'TD.Data.UserSupportInfo.UserSupportInfo'
data GetUserSupportInfo
  = GetUserSupportInfo
    { user_id :: Maybe Int -- ^ User identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserSupportInfo where
  shortShow
    GetUserSupportInfo
      { user_id = user_id_
      }
        = "GetUserSupportInfo"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON GetUserSupportInfo where
  toJSON
    GetUserSupportInfo
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getUserSupportInfo"
          , "user_id" A..= user_id_
          ]

