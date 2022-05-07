{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatPhotos where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatPhoto as ChatPhoto
import qualified Utils as U

data ChatPhotos = -- | Contains a list of chat or user profile photos @total_count Total number of photos @photos List of photos
  ChatPhotos
  { -- |
    photos :: Maybe [ChatPhoto.ChatPhoto],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatPhotos where
  show
    ChatPhotos
      { photos = photos,
        total_count = total_count
      } =
      "ChatPhotos"
        ++ U.cc
          [ U.p "photos" photos,
            U.p "total_count" total_count
          ]

instance T.FromJSON ChatPhotos where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPhotos" -> parseChatPhotos v
      _ -> fail ""
    where
      parseChatPhotos :: A.Value -> T.Parser ChatPhotos
      parseChatPhotos = A.withObject "ChatPhotos" $ \o -> do
        photos_ <- o A..:? "photos"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatPhotos {photos = photos_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON ChatPhotos where
  toJSON
    ChatPhotos
      { photos = photos,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "chatPhotos",
          "photos" A..= photos,
          "total_count" A..= total_count
        ]
