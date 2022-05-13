{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.GroupCallStreams where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.GroupCallStream as GroupCallStream
import qualified Utils as U

data GroupCallStreams = -- | Represents a list of group call streams @streams A list of group call streams
  GroupCallStreams
  { -- |
    streams :: Maybe [GroupCallStream.GroupCallStream]
  }
  deriving (Eq)

instance Show GroupCallStreams where
  show
    GroupCallStreams
      { streams = streams_
      } =
      "GroupCallStreams"
        ++ U.cc
          [ U.p "streams" streams_
          ]

instance T.FromJSON GroupCallStreams where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCallStreams" -> parseGroupCallStreams v
      _ -> mempty
    where
      parseGroupCallStreams :: A.Value -> T.Parser GroupCallStreams
      parseGroupCallStreams = A.withObject "GroupCallStreams" $ \o -> do
        streams_ <- o A..:? "streams"
        return $ GroupCallStreams {streams = streams_}
  parseJSON _ = mempty

instance T.ToJSON GroupCallStreams where
  toJSON
    GroupCallStreams
      { streams = streams_
      } =
      A.object
        [ "@type" A..= T.String "groupCallStreams",
          "streams" A..= streams_
        ]
