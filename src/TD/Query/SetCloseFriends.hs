module TD.Query.SetCloseFriends
  (SetCloseFriends(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the list of close friends of the current user. Returns 'TD.Data.Ok.Ok'
data SetCloseFriends
  = SetCloseFriends
    { user_ids :: Maybe [Int] -- ^ User identifiers of close friends; the users must be contacts of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow SetCloseFriends where
  shortShow
    SetCloseFriends
      { user_ids = user_ids_
      }
        = "SetCloseFriends"
          ++ I.cc
          [ "user_ids" `I.p` user_ids_
          ]

instance AT.ToJSON SetCloseFriends where
  toJSON
    SetCloseFriends
      { user_ids = user_ids_
      }
        = A.object
          [ "@type"    A..= AT.String "setCloseFriends"
          , "user_ids" A..= user_ids_
          ]

