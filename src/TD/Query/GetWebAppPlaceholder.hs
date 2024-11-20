module TD.Query.GetWebAppPlaceholder
  (GetWebAppPlaceholder(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a default placeholder for Web Apps of a bot; this is an offline request. Returns a 404 error if the placeholder isn't known. Returns 'TD.Data.Outline.Outline'
data GetWebAppPlaceholder
  = GetWebAppPlaceholder
    { bot_user_id :: Maybe Int -- ^ Identifier of the target bot
    }
  deriving (Eq, Show)

instance I.ShortShow GetWebAppPlaceholder where
  shortShow
    GetWebAppPlaceholder
      { bot_user_id = bot_user_id_
      }
        = "GetWebAppPlaceholder"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON GetWebAppPlaceholder where
  toJSON
    GetWebAppPlaceholder
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "getWebAppPlaceholder"
          , "bot_user_id" A..= bot_user_id_
          ]

