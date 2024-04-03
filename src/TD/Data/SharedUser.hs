module TD.Data.SharedUser
  (SharedUser(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo

data SharedUser
  = SharedUser -- ^ Contains information about a user shared with a bot
    { user_id    :: Maybe Int         -- ^ User identifier
    , first_name :: Maybe T.Text      -- ^ First name of the user; for bots only
    , last_name  :: Maybe T.Text      -- ^ Last name of the user; for bots only
    , username   :: Maybe T.Text      -- ^ Username of the user; for bots only
    , photo      :: Maybe Photo.Photo -- ^ Profile photo of the user; for bots only; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow SharedUser where
  shortShow SharedUser
    { user_id    = user_id_
    , first_name = first_name_
    , last_name  = last_name_
    , username   = username_
    , photo      = photo_
    }
      = "SharedUser"
        ++ I.cc
        [ "user_id"    `I.p` user_id_
        , "first_name" `I.p` first_name_
        , "last_name"  `I.p` last_name_
        , "username"   `I.p` username_
        , "photo"      `I.p` photo_
        ]

instance AT.FromJSON SharedUser where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sharedUser" -> parseSharedUser v
      _            -> mempty
    
    where
      parseSharedUser :: A.Value -> AT.Parser SharedUser
      parseSharedUser = A.withObject "SharedUser" $ \o -> do
        user_id_    <- o A..:?  "user_id"
        first_name_ <- o A..:?  "first_name"
        last_name_  <- o A..:?  "last_name"
        username_   <- o A..:?  "username"
        photo_      <- o A..:?  "photo"
        pure $ SharedUser
          { user_id    = user_id_
          , first_name = first_name_
          , last_name  = last_name_
          , username   = username_
          , photo      = photo_
          }
  parseJSON _ = mempty

