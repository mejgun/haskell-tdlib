{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- | Contains information about background to set
data InputBackground
  = -- | A background from a local file
    InputBackgroundLocal
      { -- | Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns
        background :: Maybe InputFile.InputFile
      }
  | -- | A background from the server @background_id The background identifier
    InputBackgroundRemote
      { -- |
        background_id :: Maybe Int
      }
  | -- | A background previously set in the chat; for chat backgrounds only @message_id Identifier of the message with the background
    InputBackgroundPrevious
      { -- |
        message_id :: Maybe Int
      }
  deriving (Eq)

instance Show InputBackground where
  show
    InputBackgroundLocal
      { background = background_
      } =
      "InputBackgroundLocal"
        ++ U.cc
          [ U.p "background" background_
          ]
  show
    InputBackgroundRemote
      { background_id = background_id_
      } =
      "InputBackgroundRemote"
        ++ U.cc
          [ U.p "background_id" background_id_
          ]
  show
    InputBackgroundPrevious
      { message_id = message_id_
      } =
      "InputBackgroundPrevious"
        ++ U.cc
          [ U.p "message_id" message_id_
          ]

instance T.FromJSON InputBackground where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputBackgroundLocal" -> parseInputBackgroundLocal v
      "inputBackgroundRemote" -> parseInputBackgroundRemote v
      "inputBackgroundPrevious" -> parseInputBackgroundPrevious v
      _ -> mempty
    where
      parseInputBackgroundLocal :: A.Value -> T.Parser InputBackground
      parseInputBackgroundLocal = A.withObject "InputBackgroundLocal" $ \o -> do
        background_ <- o A..:? "background"
        return $ InputBackgroundLocal {background = background_}

      parseInputBackgroundRemote :: A.Value -> T.Parser InputBackground
      parseInputBackgroundRemote = A.withObject "InputBackgroundRemote" $ \o -> do
        background_id_ <- U.rm <$> (o A..:? "background_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ InputBackgroundRemote {background_id = background_id_}

      parseInputBackgroundPrevious :: A.Value -> T.Parser InputBackground
      parseInputBackgroundPrevious = A.withObject "InputBackgroundPrevious" $ \o -> do
        message_id_ <- o A..:? "message_id"
        return $ InputBackgroundPrevious {message_id = message_id_}
  parseJSON _ = mempty

instance T.ToJSON InputBackground where
  toJSON
    InputBackgroundLocal
      { background = background_
      } =
      A.object
        [ "@type" A..= T.String "inputBackgroundLocal",
          "background" A..= background_
        ]
  toJSON
    InputBackgroundRemote
      { background_id = background_id_
      } =
      A.object
        [ "@type" A..= T.String "inputBackgroundRemote",
          "background_id" A..= U.toS background_id_
        ]
  toJSON
    InputBackgroundPrevious
      { message_id = message_id_
      } =
      A.object
        [ "@type" A..= T.String "inputBackgroundPrevious",
          "message_id" A..= message_id_
        ]
