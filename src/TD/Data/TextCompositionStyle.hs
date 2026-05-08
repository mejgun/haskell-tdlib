module TD.Data.TextCompositionStyle
  (TextCompositionStyle(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TextCompositionStyleExample as TextCompositionStyleExample

data TextCompositionStyle
  = TextCompositionStyle -- ^ Describes a style that can be used to compose a text
    { name            :: Maybe T.Text                                                  -- ^ Name of the style
    , custom_emoji_id :: Maybe Int                                                     -- ^ Identifier of the custom emoji corresponding to the style; 0 if none
    , title           :: Maybe T.Text                                                  -- ^ Title of the style in the user application's language
    , is_custom       :: Maybe Bool                                                    -- ^ True, if the style is created by a user
    , is_creator      :: Maybe Bool                                                    -- ^ True, if the user is creator of the style
    , install_count   :: Maybe Int                                                     -- ^ Number of users that installed the style; for created custom styles only; 0 if unknown
    , prompt          :: Maybe T.Text                                                  -- ^ Prompt of the style; for created custom styles only
    , creator_user_id :: Maybe Int                                                     -- ^ User identifier of the creator of the style; 0 if none of unknown
    , english_example :: Maybe TextCompositionStyleExample.TextCompositionStyleExample -- ^ Example of the style usage in English; may be null if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow TextCompositionStyle where
  shortShow TextCompositionStyle
    { name            = name_
    , custom_emoji_id = custom_emoji_id_
    , title           = title_
    , is_custom       = is_custom_
    , is_creator      = is_creator_
    , install_count   = install_count_
    , prompt          = prompt_
    , creator_user_id = creator_user_id_
    , english_example = english_example_
    }
      = "TextCompositionStyle"
        ++ I.cc
        [ "name"            `I.p` name_
        , "custom_emoji_id" `I.p` custom_emoji_id_
        , "title"           `I.p` title_
        , "is_custom"       `I.p` is_custom_
        , "is_creator"      `I.p` is_creator_
        , "install_count"   `I.p` install_count_
        , "prompt"          `I.p` prompt_
        , "creator_user_id" `I.p` creator_user_id_
        , "english_example" `I.p` english_example_
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
        is_custom_       <- o A..:?                       "is_custom"
        is_creator_      <- o A..:?                       "is_creator"
        install_count_   <- o A..:?                       "install_count"
        prompt_          <- o A..:?                       "prompt"
        creator_user_id_ <- o A..:?                       "creator_user_id"
        english_example_ <- o A..:?                       "english_example"
        pure $ TextCompositionStyle
          { name            = name_
          , custom_emoji_id = custom_emoji_id_
          , title           = title_
          , is_custom       = is_custom_
          , is_creator      = is_creator_
          , install_count   = install_count_
          , prompt          = prompt_
          , creator_user_id = creator_user_id_
          , english_example = english_example_
          }
  parseJSON _ = mempty

