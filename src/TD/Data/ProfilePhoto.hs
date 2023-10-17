module TD.Data.ProfilePhoto
  (ProfilePhoto(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail

data ProfilePhoto
  = ProfilePhoto -- ^ Describes a user profile photo
    { _id           :: Maybe Int                         -- ^ Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
    , small         :: Maybe File.File                   -- ^ A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
    , big           :: Maybe File.File                   -- ^ A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
    , minithumbnail :: Maybe Minithumbnail.Minithumbnail -- ^ User profile photo minithumbnail; may be null
    , has_animation :: Maybe Bool                        -- ^ True, if the photo has animated variant
    , is_personal   :: Maybe Bool                        -- ^ True, if the photo is visible only for the current user
    }
  deriving (Eq, Show)

instance I.ShortShow ProfilePhoto where
  shortShow ProfilePhoto
    { _id           = _id_
    , small         = small_
    , big           = big_
    , minithumbnail = minithumbnail_
    , has_animation = has_animation_
    , is_personal   = is_personal_
    }
      = "ProfilePhoto"
        ++ I.cc
        [ "_id"           `I.p` _id_
        , "small"         `I.p` small_
        , "big"           `I.p` big_
        , "minithumbnail" `I.p` minithumbnail_
        , "has_animation" `I.p` has_animation_
        , "is_personal"   `I.p` is_personal_
        ]

instance AT.FromJSON ProfilePhoto where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "profilePhoto" -> parseProfilePhoto v
      _              -> mempty
    
    where
      parseProfilePhoto :: A.Value -> AT.Parser ProfilePhoto
      parseProfilePhoto = A.withObject "ProfilePhoto" $ \o -> do
        _id_           <- fmap I.readInt64 <$> o A..:?  "id"
        small_         <- o A..:?                       "small"
        big_           <- o A..:?                       "big"
        minithumbnail_ <- o A..:?                       "minithumbnail"
        has_animation_ <- o A..:?                       "has_animation"
        is_personal_   <- o A..:?                       "is_personal"
        pure $ ProfilePhoto
          { _id           = _id_
          , small         = small_
          , big           = big_
          , minithumbnail = minithumbnail_
          , has_animation = has_animation_
          , is_personal   = is_personal_
          }
  parseJSON _ = mempty

