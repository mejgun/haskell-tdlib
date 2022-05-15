{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified Utils as U

-- |
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
      { has_animation = has_animation_,
        minithumbnail = minithumbnail_,
        big = big_,
        small = small_,
        _id = _id_
      } =
      "ProfilePhoto"
        ++ U.cc
          [ U.p "has_animation" has_animation_,
            U.p "minithumbnail" minithumbnail_,
            U.p "big" big_,
            U.p "small" small_,
            U.p "_id" _id_
          ]

instance T.FromJSON ProfilePhoto where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "profilePhoto" -> parseProfilePhoto v
      _ -> mempty
    where
      parseProfilePhoto :: A.Value -> T.Parser ProfilePhoto
      parseProfilePhoto = A.withObject "ProfilePhoto" $ \o -> do
        has_animation_ <- o A..:? "has_animation"
        minithumbnail_ <- o A..:? "minithumbnail"
        big_ <- o A..:? "big"
        small_ <- o A..:? "small"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ ProfilePhoto {has_animation = has_animation_, minithumbnail = minithumbnail_, big = big_, small = small_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ProfilePhoto where
  toJSON
    ProfilePhoto
      { has_animation = has_animation_,
        minithumbnail = minithumbnail_,
        big = big_,
        small = small_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "profilePhoto",
          "has_animation" A..= has_animation_,
          "minithumbnail" A..= minithumbnail_,
          "big" A..= big_,
          "small" A..= small_,
          "id" A..= U.toS _id_
        ]
