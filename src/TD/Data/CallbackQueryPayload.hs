module TD.Data.CallbackQueryPayload
  (CallbackQueryPayload(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

-- | Represents a payload of a callback query
data CallbackQueryPayload
  = CallbackQueryPayloadData -- ^ The payload for a general callback button
    { _data :: Maybe BS.ByteString -- ^ Data that was attached to the callback button
    }
  | CallbackQueryPayloadDataWithPassword -- ^ The payload for a callback button requiring password
    { password :: Maybe T.Text        -- ^ The 2-step verification password for the current user
    , _data    :: Maybe BS.ByteString -- ^ Data that was attached to the callback button
    }
  | CallbackQueryPayloadGame -- ^ The payload for a game callback button
    { game_short_name :: Maybe T.Text -- ^ A short name of the game that was attached to the callback button
    }
  deriving (Eq, Show)

instance I.ShortShow CallbackQueryPayload where
  shortShow CallbackQueryPayloadData
    { _data = _data_
    }
      = "CallbackQueryPayloadData"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]
  shortShow CallbackQueryPayloadDataWithPassword
    { password = password_
    , _data    = _data_
    }
      = "CallbackQueryPayloadDataWithPassword"
        ++ I.cc
        [ "password" `I.p` password_
        , "_data"    `I.p` _data_
        ]
  shortShow CallbackQueryPayloadGame
    { game_short_name = game_short_name_
    }
      = "CallbackQueryPayloadGame"
        ++ I.cc
        [ "game_short_name" `I.p` game_short_name_
        ]

instance AT.FromJSON CallbackQueryPayload where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callbackQueryPayloadData"             -> parseCallbackQueryPayloadData v
      "callbackQueryPayloadDataWithPassword" -> parseCallbackQueryPayloadDataWithPassword v
      "callbackQueryPayloadGame"             -> parseCallbackQueryPayloadGame v
      _                                      -> mempty
    
    where
      parseCallbackQueryPayloadData :: A.Value -> AT.Parser CallbackQueryPayload
      parseCallbackQueryPayloadData = A.withObject "CallbackQueryPayloadData" $ \o -> do
        _data_ <- fmap I.readBytes <$> o A..:?  "data"
        pure $ CallbackQueryPayloadData
          { _data = _data_
          }
      parseCallbackQueryPayloadDataWithPassword :: A.Value -> AT.Parser CallbackQueryPayload
      parseCallbackQueryPayloadDataWithPassword = A.withObject "CallbackQueryPayloadDataWithPassword" $ \o -> do
        password_ <- o A..:?                       "password"
        _data_    <- fmap I.readBytes <$> o A..:?  "data"
        pure $ CallbackQueryPayloadDataWithPassword
          { password = password_
          , _data    = _data_
          }
      parseCallbackQueryPayloadGame :: A.Value -> AT.Parser CallbackQueryPayload
      parseCallbackQueryPayloadGame = A.withObject "CallbackQueryPayloadGame" $ \o -> do
        game_short_name_ <- o A..:?  "game_short_name"
        pure $ CallbackQueryPayloadGame
          { game_short_name = game_short_name_
          }
  parseJSON _ = mempty

instance AT.ToJSON CallbackQueryPayload where
  toJSON CallbackQueryPayloadData
    { _data = _data_
    }
      = A.object
        [ "@type" A..= AT.String "callbackQueryPayloadData"
        , "data"  A..= fmap I.writeBytes  _data_
        ]
  toJSON CallbackQueryPayloadDataWithPassword
    { password = password_
    , _data    = _data_
    }
      = A.object
        [ "@type"    A..= AT.String "callbackQueryPayloadDataWithPassword"
        , "password" A..= password_
        , "data"     A..= fmap I.writeBytes  _data_
        ]
  toJSON CallbackQueryPayloadGame
    { game_short_name = game_short_name_
    }
      = A.object
        [ "@type"           A..= AT.String "callbackQueryPayloadGame"
        , "game_short_name" A..= game_short_name_
        ]

