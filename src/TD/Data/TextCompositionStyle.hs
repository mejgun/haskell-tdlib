module TD.Data.TextCompositionStyle
  (TextCompositionStyle(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TextCompositionStyle
  = TextCompositionStyle -- ^ Describes a style that can be used to compose a text
    { name            :: Maybe T.Text -- ^ Name of the style
    , custom_emoji_id :: Maybe Int    -- ^ Identifier of the custom emoji corresponding to the style
    , title           :: Maybe T.Text -- ^ Title of the style in the user application's language
    }
  deriving (Eq, Show)

instance I.ShortShow TextCompositionStyle where
  shortShow TextCompositionStyle
    { name            = name_
    , custom_emoji_id = custom_emoji_id_
    , title           = title_
    }
      = "TextCompositionStyle"
        ++ I.cc
        [ "name"            `I.p` name_
        , "custom_emoji_id" `I.p` custom_emoji_id_
        , "title"           `I.p` title_
        ]

instance AT.FromJSON TextCompositionStyle where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textCompositionStyle" -> parseTextCompositionStyle v
      _                      -> mempty
    
    where
      parseTextCompositionStyle :: A.Value -> AT.Parser TextCompositionStyle
      parseTextCompositionStyle = A.withObject "TextCompositionStyle" $ \o -> do
        name_            <- o A..:?                       "name"
        custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        title_           <- o A..:?                       "title"
        pure $ TextCompositionStyle
          { name            = name_
          , custom_emoji_id = custom_emoji_id_
          , title           = title_
          }
  parseJSON _ = mempty

