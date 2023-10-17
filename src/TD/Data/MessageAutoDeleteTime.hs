module TD.Data.MessageAutoDeleteTime
  ( MessageAutoDeleteTime(..)    
  , defaultMessageAutoDeleteTime 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data MessageAutoDeleteTime
  = MessageAutoDeleteTime -- ^ Contains default auto-delete timer setting for new chats
    { time :: Maybe Int -- ^ Message auto-delete time, in seconds. If 0, then messages aren't deleted automatically
    }
  deriving (Eq, Show)

instance I.ShortShow MessageAutoDeleteTime where
  shortShow MessageAutoDeleteTime
    { time = time_
    }
      = "MessageAutoDeleteTime"
        ++ I.cc
        [ "time" `I.p` time_
        ]

instance AT.FromJSON MessageAutoDeleteTime where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageAutoDeleteTime" -> parseMessageAutoDeleteTime v
      _                       -> mempty
    
    where
      parseMessageAutoDeleteTime :: A.Value -> AT.Parser MessageAutoDeleteTime
      parseMessageAutoDeleteTime = A.withObject "MessageAutoDeleteTime" $ \o -> do
        time_ <- o A..:?  "time"
        pure $ MessageAutoDeleteTime
          { time = time_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageAutoDeleteTime where
  toJSON MessageAutoDeleteTime
    { time = time_
    }
      = A.object
        [ "@type" A..= AT.String "messageAutoDeleteTime"
        , "time"  A..= time_
        ]

defaultMessageAutoDeleteTime :: MessageAutoDeleteTime
defaultMessageAutoDeleteTime =
  MessageAutoDeleteTime
    { time = Nothing
    }

