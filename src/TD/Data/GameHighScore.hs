module TD.Data.GameHighScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GameHighScore
  = GameHighScore -- ^ Contains one row of the game high score table
    { position :: Maybe Int -- ^ Position in the high score table
    , user_id  :: Maybe Int -- ^ User identifier
    , score    :: Maybe Int -- ^ User score
    }
  deriving (Eq)

instance Show GameHighScore where
  show GameHighScore
    { position = position_
    , user_id  = user_id_
    , score    = score_
    }
      = "GameHighScore"
        ++ I.cc
        [ "position" `I.p` position_
        , "user_id"  `I.p` user_id_
        , "score"    `I.p` score_
        ]

instance AT.FromJSON GameHighScore where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "gameHighScore" -> parseGameHighScore v
      _               -> mempty
    
    where
      parseGameHighScore :: A.Value -> AT.Parser GameHighScore
      parseGameHighScore = A.withObject "GameHighScore" $ \o -> do
        position_ <- o A..:?  "position"
        user_id_  <- o A..:?  "user_id"
        score_    <- o A..:?  "score"
        pure $ GameHighScore
          { position = position_
          , user_id  = user_id_
          , score    = score_
          }

instance AT.ToJSON GameHighScore where
  toJSON GameHighScore
    { position = position_
    , user_id  = user_id_
    , score    = score_
    }
      = A.object
        [ "@type"    A..= AT.String "gameHighScore"
        , "position" A..= position_
        , "user_id"  A..= user_id_
        , "score"    A..= score_
        ]
