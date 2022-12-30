{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageAutoDeleteTime where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data MessageAutoDeleteTime = -- | Contains default auto-delete timer setting for new chats @time Message auto-delete time, in seconds. If 0, then messages aren't deleted automatically
  MessageAutoDeleteTime
  { -- |
    time :: Maybe Int
  }
  deriving (Eq)

instance Show MessageAutoDeleteTime where
  show
    MessageAutoDeleteTime
      { time = time_
      } =
      "MessageAutoDeleteTime"
        ++ U.cc
          [ U.p "time" time_
          ]

instance T.FromJSON MessageAutoDeleteTime where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageAutoDeleteTime" -> parseMessageAutoDeleteTime v
      _ -> mempty
    where
      parseMessageAutoDeleteTime :: A.Value -> T.Parser MessageAutoDeleteTime
      parseMessageAutoDeleteTime = A.withObject "MessageAutoDeleteTime" $ \o -> do
        time_ <- o A..:? "time"
        return $ MessageAutoDeleteTime {time = time_}
  parseJSON _ = mempty

instance T.ToJSON MessageAutoDeleteTime where
  toJSON
    MessageAutoDeleteTime
      { time = time_
      } =
      A.object
        [ "@type" A..= T.String "messageAutoDeleteTime",
          "time" A..= time_
        ]
