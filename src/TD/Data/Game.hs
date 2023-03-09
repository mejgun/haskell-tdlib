{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Game where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Photo as Photo
import qualified Utils as U

-- |
data Game = -- | Describes a game. Use getInternalLink with internalLinkTypeGame to share the game
  Game
  { -- | Game animation; may be null
    animation :: Maybe Animation.Animation,
    -- | Game photo
    photo :: Maybe Photo.Photo,
    -- |
    description :: Maybe String,
    -- | Game text, usually containing scoreboards for a game
    text :: Maybe FormattedText.FormattedText,
    -- | Game title
    title :: Maybe String,
    -- | Game short name
    short_name :: Maybe String,
    -- | Unique game identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Game where
  show
    Game
      { animation = animation_,
        photo = photo_,
        description = description_,
        text = text_,
        title = title_,
        short_name = short_name_,
        _id = _id_
      } =
      "Game"
        ++ U.cc
          [ U.p "animation" animation_,
            U.p "photo" photo_,
            U.p "description" description_,
            U.p "text" text_,
            U.p "title" title_,
            U.p "short_name" short_name_,
            U.p "_id" _id_
          ]

instance T.FromJSON Game where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "game" -> parseGame v
      _ -> mempty
    where
      parseGame :: A.Value -> T.Parser Game
      parseGame = A.withObject "Game" $ \o -> do
        animation_ <- o A..:? "animation"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        text_ <- o A..:? "text"
        title_ <- o A..:? "title"
        short_name_ <- o A..:? "short_name"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ Game {animation = animation_, photo = photo_, description = description_, text = text_, title = title_, short_name = short_name_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Game where
  toJSON
    Game
      { animation = animation_,
        photo = photo_,
        description = description_,
        text = text_,
        title = title_,
        short_name = short_name_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "game",
          "animation" A..= animation_,
          "photo" A..= photo_,
          "description" A..= description_,
          "text" A..= text_,
          "title" A..= title_,
          "short_name" A..= short_name_,
          "id" A..= U.toS _id_
        ]
