module TD.Data.ChatPhotoInfo (ChatPhotoInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail

data ChatPhotoInfo
  = ChatPhotoInfo -- ^ Contains basic information about the photo of a chat
    { small         :: Maybe File.File                   -- ^ A small (160x160) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
    , big           :: Maybe File.File                   -- ^ A big (640x640) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
    , minithumbnail :: Maybe Minithumbnail.Minithumbnail -- ^ Chat photo minithumbnail; may be null
    , has_animation :: Maybe Bool                        -- ^ True, if the photo has animated variant
    , is_personal   :: Maybe Bool                        -- ^ True, if the photo is visible only for the current user
    }
  deriving (Eq)

instance Show ChatPhotoInfo where
  show ChatPhotoInfo
    { small         = small_
    , big           = big_
    , minithumbnail = minithumbnail_
    , has_animation = has_animation_
    , is_personal   = is_personal_
    }
      = "ChatPhotoInfo"
        ++ I.cc
        [ "small"         `I.p` small_
        , "big"           `I.p` big_
        , "minithumbnail" `I.p` minithumbnail_
        , "has_animation" `I.p` has_animation_
        , "is_personal"   `I.p` is_personal_
        ]

instance AT.FromJSON ChatPhotoInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatPhotoInfo" -> parseChatPhotoInfo v
      _               -> mempty
    
    where
      parseChatPhotoInfo :: A.Value -> AT.Parser ChatPhotoInfo
      parseChatPhotoInfo = A.withObject "ChatPhotoInfo" $ \o -> do
        small_         <- o A..:?  "small"
        big_           <- o A..:?  "big"
        minithumbnail_ <- o A..:?  "minithumbnail"
        has_animation_ <- o A..:?  "has_animation"
        is_personal_   <- o A..:?  "is_personal"
        pure $ ChatPhotoInfo
          { small         = small_
          , big           = big_
          , minithumbnail = minithumbnail_
          , has_animation = has_animation_
          , is_personal   = is_personal_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatPhotoInfo where
  toJSON ChatPhotoInfo
    { small         = small_
    , big           = big_
    , minithumbnail = minithumbnail_
    , has_animation = has_animation_
    , is_personal   = is_personal_
    }
      = A.object
        [ "@type"         A..= AT.String "chatPhotoInfo"
        , "small"         A..= small_
        , "big"           A..= big_
        , "minithumbnail" A..= minithumbnail_
        , "has_animation" A..= has_animation_
        , "is_personal"   A..= is_personal_
        ]
