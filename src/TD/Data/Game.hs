module TD.Data.Game
  (Game(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Animation as Animation

data Game
  = Game -- ^ Describes a game. Use getInternalLink with internalLinkTypeGame to share the game
    { _id         :: Maybe Int                         -- ^ Unique game identifier
    , short_name  :: Maybe T.Text                      -- ^ Game short name
    , title       :: Maybe T.Text                      -- ^ Game title
    , text        :: Maybe FormattedText.FormattedText -- ^ Game text, usually containing scoreboards for a game
    , description :: Maybe T.Text                      -- ^ Game description
    , photo       :: Maybe Photo.Photo                 -- ^ Game photo
    , animation   :: Maybe Animation.Animation         -- ^ Game animation; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow Game where
  shortShow Game
    { _id         = _id_
    , short_name  = short_name_
    , title       = title_
    , text        = text_
    , description = description_
    , photo       = photo_
    , animation   = animation_
    }
      = "Game"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "short_name"  `I.p` short_name_
        , "title"       `I.p` title_
        , "text"        `I.p` text_
        , "description" `I.p` description_
        , "photo"       `I.p` photo_
        , "animation"   `I.p` animation_
        ]

instance AT.FromJSON Game where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "game" -> parseGame v
      _      -> mempty
    
    where
      parseGame :: A.Value -> AT.Parser Game
      parseGame = A.withObject "Game" $ \o -> do
        _id_         <- fmap I.readInt64 <$> o A..:?  "id"
        short_name_  <- o A..:?                       "short_name"
        title_       <- o A..:?                       "title"
        text_        <- o A..:?                       "text"
        description_ <- o A..:?                       "description"
        photo_       <- o A..:?                       "photo"
        animation_   <- o A..:?                       "animation"
        pure $ Game
          { _id         = _id_
          , short_name  = short_name_
          , title       = title_
          , text        = text_
          , description = description_
          , photo       = photo_
          , animation   = animation_
          }
  parseJSON _ = mempty

