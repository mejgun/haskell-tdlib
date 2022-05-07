{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Game where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Animation as Animation
import qualified TD.Reply.FormattedText as FormattedText
import qualified TD.Reply.Photo as Photo
import qualified Utils as U

data Game = -- | Describes a game @id Game ID @short_name Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name} @title Game title @text Game text, usually containing scoreboards for a game
  Game
  { -- |
    animation :: Maybe Animation.Animation,
    -- |
    photo :: Maybe Photo.Photo,
    -- |
    description :: Maybe String,
    -- |
    text :: Maybe FormattedText.FormattedText,
    -- |
    title :: Maybe String,
    -- |
    short_name :: Maybe String,
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Game where
  show
    Game
      { animation = animation,
        photo = photo,
        description = description,
        text = text,
        title = title,
        short_name = short_name,
        _id = _id
      } =
      "Game"
        ++ U.cc
          [ U.p "animation" animation,
            U.p "photo" photo,
            U.p "description" description,
            U.p "text" text,
            U.p "title" title,
            U.p "short_name" short_name,
            U.p "_id" _id
          ]

instance T.FromJSON Game where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "game" -> parseGame v
      _ -> fail ""
    where
      parseGame :: A.Value -> T.Parser Game
      parseGame = A.withObject "Game" $ \o -> do
        animation_ <- o A..:? "animation"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        text_ <- o A..:? "text"
        title_ <- o A..:? "title"
        short_name_ <- o A..:? "short_name"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Game {animation = animation_, photo = photo_, description = description_, text = text_, title = title_, short_name = short_name_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON Game where
  toJSON
    Game
      { animation = animation,
        photo = photo,
        description = description,
        text = text,
        title = title,
        short_name = short_name,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "game",
          "animation" A..= animation,
          "photo" A..= photo,
          "description" A..= description,
          "text" A..= text,
          "title" A..= title,
          "short_name" A..= short_name,
          "id" A..= _id
        ]
