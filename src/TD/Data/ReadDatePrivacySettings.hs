module TD.Data.ReadDatePrivacySettings
  ( ReadDatePrivacySettings(..)    
  , defaultReadDatePrivacySettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ReadDatePrivacySettings
  = ReadDatePrivacySettings -- ^ Contains privacy settings for message read date in private chats. Read dates are always shown to the users that can see online status of the current user regardless of this setting
    { show_read_date :: Maybe Bool -- ^ True, if message read date is shown to other users in private chats. If false and the current user isn't a Telegram Premium user, then they will not be able to see other's message read date
    }
  deriving (Eq, Show)

instance I.ShortShow ReadDatePrivacySettings where
  shortShow ReadDatePrivacySettings
    { show_read_date = show_read_date_
    }
      = "ReadDatePrivacySettings"
        ++ I.cc
        [ "show_read_date" `I.p` show_read_date_
        ]

instance AT.FromJSON ReadDatePrivacySettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "readDatePrivacySettings" -> parseReadDatePrivacySettings v
      _                         -> mempty
    
    where
      parseReadDatePrivacySettings :: A.Value -> AT.Parser ReadDatePrivacySettings
      parseReadDatePrivacySettings = A.withObject "ReadDatePrivacySettings" $ \o -> do
        show_read_date_ <- o A..:?  "show_read_date"
        pure $ ReadDatePrivacySettings
          { show_read_date = show_read_date_
          }
  parseJSON _ = mempty

instance AT.ToJSON ReadDatePrivacySettings where
  toJSON ReadDatePrivacySettings
    { show_read_date = show_read_date_
    }
      = A.object
        [ "@type"          A..= AT.String "readDatePrivacySettings"
        , "show_read_date" A..= show_read_date_
        ]

defaultReadDatePrivacySettings :: ReadDatePrivacySettings
defaultReadDatePrivacySettings =
  ReadDatePrivacySettings
    { show_read_date = Nothing
    }

