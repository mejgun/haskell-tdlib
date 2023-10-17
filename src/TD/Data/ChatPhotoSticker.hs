module TD.Data.ChatPhotoSticker
  ( ChatPhotoSticker(..)    
  , defaultChatPhotoSticker 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatPhotoStickerType as ChatPhotoStickerType
import qualified TD.Data.BackgroundFill as BackgroundFill

data ChatPhotoSticker
  = ChatPhotoSticker -- ^ Information about the sticker, which was used to create the chat photo. The sticker is shown at the center of the photo and occupies at most 67% of it
    { _type           :: Maybe ChatPhotoStickerType.ChatPhotoStickerType -- ^ Type of the sticker
    , background_fill :: Maybe BackgroundFill.BackgroundFill             -- ^ The fill to be used as background for the sticker; rotation angle in backgroundFillGradient isn't supported
    }
  deriving (Eq, Show)

instance I.ShortShow ChatPhotoSticker where
  shortShow ChatPhotoSticker
    { _type           = _type_
    , background_fill = background_fill_
    }
      = "ChatPhotoSticker"
        ++ I.cc
        [ "_type"           `I.p` _type_
        , "background_fill" `I.p` background_fill_
        ]

instance AT.FromJSON ChatPhotoSticker where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatPhotoSticker" -> parseChatPhotoSticker v
      _                  -> mempty
    
    where
      parseChatPhotoSticker :: A.Value -> AT.Parser ChatPhotoSticker
      parseChatPhotoSticker = A.withObject "ChatPhotoSticker" $ \o -> do
        _type_           <- o A..:?  "type"
        background_fill_ <- o A..:?  "background_fill"
        pure $ ChatPhotoSticker
          { _type           = _type_
          , background_fill = background_fill_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatPhotoSticker where
  toJSON ChatPhotoSticker
    { _type           = _type_
    , background_fill = background_fill_
    }
      = A.object
        [ "@type"           A..= AT.String "chatPhotoSticker"
        , "type"            A..= _type_
        , "background_fill" A..= background_fill_
        ]

defaultChatPhotoSticker :: ChatPhotoSticker
defaultChatPhotoSticker =
  ChatPhotoSticker
    { _type           = Nothing
    , background_fill = Nothing
    }

