module TD.Data.EmojiStatus
  ( EmojiStatus(..)    
  , defaultEmojiStatus 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiStatusType as EmojiStatusType

data EmojiStatus
  = EmojiStatus -- ^ Describes an emoji to be shown instead of the Telegram Premium badge
    { _type           :: Maybe EmojiStatusType.EmojiStatusType -- ^ Type of the emoji status
    , expiration_date :: Maybe Int                             -- ^ Point in time (Unix timestamp) when the status will expire; 0 if never
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiStatus where
  shortShow EmojiStatus
    { _type           = _type_
    , expiration_date = expiration_date_
    }
      = "EmojiStatus"
        ++ I.cc
        [ "_type"           `I.p` _type_
        , "expiration_date" `I.p` expiration_date_
        ]

instance AT.FromJSON EmojiStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiStatus" -> parseEmojiStatus v
      _             -> mempty
    
    where
      parseEmojiStatus :: A.Value -> AT.Parser EmojiStatus
      parseEmojiStatus = A.withObject "EmojiStatus" $ \o -> do
        _type_           <- o A..:?  "type"
        expiration_date_ <- o A..:?  "expiration_date"
        pure $ EmojiStatus
          { _type           = _type_
          , expiration_date = expiration_date_
          }
  parseJSON _ = mempty

instance AT.ToJSON EmojiStatus where
  toJSON EmojiStatus
    { _type           = _type_
    , expiration_date = expiration_date_
    }
      = A.object
        [ "@type"           A..= AT.String "emojiStatus"
        , "type"            A..= _type_
        , "expiration_date" A..= expiration_date_
        ]

defaultEmojiStatus :: EmojiStatus
defaultEmojiStatus =
  EmojiStatus
    { _type           = Nothing
    , expiration_date = Nothing
    }

