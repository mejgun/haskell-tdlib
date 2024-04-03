module TD.Data.CloseBirthdayUser
  (CloseBirthdayUser(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Birthdate as Birthdate

data CloseBirthdayUser
  = CloseBirthdayUser -- ^ Describes a user that had or will have a birthday soon
    { user_id   :: Maybe Int                 -- ^ User identifier
    , birthdate :: Maybe Birthdate.Birthdate -- ^ Birthdate of the user
    }
  deriving (Eq, Show)

instance I.ShortShow CloseBirthdayUser where
  shortShow CloseBirthdayUser
    { user_id   = user_id_
    , birthdate = birthdate_
    }
      = "CloseBirthdayUser"
        ++ I.cc
        [ "user_id"   `I.p` user_id_
        , "birthdate" `I.p` birthdate_
        ]

instance AT.FromJSON CloseBirthdayUser where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "closeBirthdayUser" -> parseCloseBirthdayUser v
      _                   -> mempty
    
    where
      parseCloseBirthdayUser :: A.Value -> AT.Parser CloseBirthdayUser
      parseCloseBirthdayUser = A.withObject "CloseBirthdayUser" $ \o -> do
        user_id_   <- o A..:?  "user_id"
        birthdate_ <- o A..:?  "birthdate"
        pure $ CloseBirthdayUser
          { user_id   = user_id_
          , birthdate = birthdate_
          }
  parseJSON _ = mempty

