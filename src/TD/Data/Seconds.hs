{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Seconds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data Seconds = -- | Contains a value representing a number of seconds @seconds Number of seconds
  Seconds
  { -- |
    seconds :: Maybe Float
  }
  deriving (Eq)

instance Show Seconds where
  show
    Seconds
      { seconds = seconds_
      } =
      "Seconds"
        ++ U.cc
          [ U.p "seconds" seconds_
          ]

instance T.FromJSON Seconds where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "seconds" -> parseSeconds v
      _ -> mempty
    where
      parseSeconds :: A.Value -> T.Parser Seconds
      parseSeconds = A.withObject "Seconds" $ \o -> do
        seconds_ <- o A..:? "seconds"
        return $ Seconds {seconds = seconds_}
  parseJSON _ = mempty

instance T.ToJSON Seconds where
  toJSON
    Seconds
      { seconds = seconds_
      } =
      A.object
        [ "@type" A..= T.String "seconds",
          "seconds" A..= seconds_
        ]
