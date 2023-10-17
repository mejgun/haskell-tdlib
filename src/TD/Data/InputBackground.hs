module TD.Data.InputBackground
  (InputBackground(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Contains information about background to set
data InputBackground
  = InputBackgroundLocal -- ^ A background from a local file
    { background :: Maybe InputFile.InputFile -- ^ Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns
    }
  | InputBackgroundRemote -- ^ A background from the server
    { background_id :: Maybe Int -- ^ The background identifier
    }
  | InputBackgroundPrevious -- ^ A background previously set in the chat; for chat backgrounds only
    { message_id :: Maybe Int -- ^ Identifier of the message with the background
    }
  deriving (Eq, Show)

instance I.ShortShow InputBackground where
  shortShow InputBackgroundLocal
    { background = background_
    }
      = "InputBackgroundLocal"
        ++ I.cc
        [ "background" `I.p` background_
        ]
  shortShow InputBackgroundRemote
    { background_id = background_id_
    }
      = "InputBackgroundRemote"
        ++ I.cc
        [ "background_id" `I.p` background_id_
        ]
  shortShow InputBackgroundPrevious
    { message_id = message_id_
    }
      = "InputBackgroundPrevious"
        ++ I.cc
        [ "message_id" `I.p` message_id_
        ]

instance AT.FromJSON InputBackground where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputBackgroundLocal"    -> parseInputBackgroundLocal v
      "inputBackgroundRemote"   -> parseInputBackgroundRemote v
      "inputBackgroundPrevious" -> parseInputBackgroundPrevious v
      _                         -> mempty
    
    where
      parseInputBackgroundLocal :: A.Value -> AT.Parser InputBackground
      parseInputBackgroundLocal = A.withObject "InputBackgroundLocal" $ \o -> do
        background_ <- o A..:?  "background"
        pure $ InputBackgroundLocal
          { background = background_
          }
      parseInputBackgroundRemote :: A.Value -> AT.Parser InputBackground
      parseInputBackgroundRemote = A.withObject "InputBackgroundRemote" $ \o -> do
        background_id_ <- fmap I.readInt64 <$> o A..:?  "background_id"
        pure $ InputBackgroundRemote
          { background_id = background_id_
          }
      parseInputBackgroundPrevious :: A.Value -> AT.Parser InputBackground
      parseInputBackgroundPrevious = A.withObject "InputBackgroundPrevious" $ \o -> do
        message_id_ <- o A..:?  "message_id"
        pure $ InputBackgroundPrevious
          { message_id = message_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputBackground where
  toJSON InputBackgroundLocal
    { background = background_
    }
      = A.object
        [ "@type"      A..= AT.String "inputBackgroundLocal"
        , "background" A..= background_
        ]
  toJSON InputBackgroundRemote
    { background_id = background_id_
    }
      = A.object
        [ "@type"         A..= AT.String "inputBackgroundRemote"
        , "background_id" A..= fmap I.writeInt64  background_id_
        ]
  toJSON InputBackgroundPrevious
    { message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "inputBackgroundPrevious"
        , "message_id" A..= message_id_
        ]

