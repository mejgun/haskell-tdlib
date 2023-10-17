module TD.Data.ChatPhotos
  (ChatPhotos(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatPhoto as ChatPhoto

data ChatPhotos
  = ChatPhotos -- ^ Contains a list of chat or user profile photos
    { total_count :: Maybe Int                   -- ^ Total number of photos
    , photos      :: Maybe [ChatPhoto.ChatPhoto] -- ^ List of photos
    }
  deriving (Eq, Show)

instance I.ShortShow ChatPhotos where
  shortShow ChatPhotos
    { total_count = total_count_
    , photos      = photos_
    }
      = "ChatPhotos"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "photos"      `I.p` photos_
        ]

instance AT.FromJSON ChatPhotos where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatPhotos" -> parseChatPhotos v
      _            -> mempty
    
    where
      parseChatPhotos :: A.Value -> AT.Parser ChatPhotos
      parseChatPhotos = A.withObject "ChatPhotos" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        photos_      <- o A..:?  "photos"
        pure $ ChatPhotos
          { total_count = total_count_
          , photos      = photos_
          }
  parseJSON _ = mempty

