{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.File as File
import qualified TD.Reply.Minithumbnail as Minithumbnail
import qualified Utils as U

data ProfilePhoto = -- | Describes a user profile photo @id Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
  ProfilePhoto
  { -- | True, if the photo has animated variant
    has_animation :: Maybe Bool,
    -- | User profile photo minithumbnail; may be null
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
    big :: Maybe File.File,
    -- | A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
    small :: Maybe File.File,
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show ProfilePhoto where
  show
    ProfilePhoto
      { has_animation = has_animation,
        minithumbnail = minithumbnail,
        big = big,
        small = small,
        _id = _id
      } =
      "ProfilePhoto"
        ++ U.cc
          [ U.p "has_animation" has_animation,
            U.p "minithumbnail" minithumbnail,
            U.p "big" big,
            U.p "small" small,
            U.p "_id" _id
          ]

instance T.FromJSON ProfilePhoto where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "profilePhoto" -> parseProfilePhoto v
      _ -> fail ""
    where
      parseProfilePhoto :: A.Value -> T.Parser ProfilePhoto
      parseProfilePhoto = A.withObject "ProfilePhoto" $ \o -> do
        has_animation_ <- o A..:? "has_animation"
        minithumbnail_ <- o A..:? "minithumbnail"
        big_ <- o A..:? "big"
        small_ <- o A..:? "small"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ProfilePhoto {has_animation = has_animation_, minithumbnail = minithumbnail_, big = big_, small = small_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON ProfilePhoto where
  toJSON
    ProfilePhoto
      { has_animation = has_animation,
        minithumbnail = minithumbnail,
        big = big,
        small = small,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "profilePhoto",
          "has_animation" A..= has_animation,
          "minithumbnail" A..= minithumbnail,
          "big" A..= big,
          "small" A..= small,
          "id" A..= _id
        ]
