{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.LogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data LogVerbosityLevel = -- | Contains a TDLib internal log verbosity level @verbosity_level Log verbosity level
  LogVerbosityLevel
  { -- |
    verbosity_level :: Maybe Int
  }
  deriving (Eq)

instance Show LogVerbosityLevel where
  show
    LogVerbosityLevel
      { verbosity_level = verbosity_level_
      } =
      "LogVerbosityLevel"
        ++ U.cc
          [ U.p "verbosity_level" verbosity_level_
          ]

instance T.FromJSON LogVerbosityLevel where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "logVerbosityLevel" -> parseLogVerbosityLevel v
      _ -> mempty
    where
      parseLogVerbosityLevel :: A.Value -> T.Parser LogVerbosityLevel
      parseLogVerbosityLevel = A.withObject "LogVerbosityLevel" $ \o -> do
        verbosity_level_ <- mconcat [o A..:? "verbosity_level", U.rm <$> (o A..: "verbosity_level" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ LogVerbosityLevel {verbosity_level = verbosity_level_}
  parseJSON _ = mempty

instance T.ToJSON LogVerbosityLevel where
  toJSON
    LogVerbosityLevel
      { verbosity_level = verbosity_level_
      } =
      A.object
        [ "@type" A..= T.String "logVerbosityLevel",
          "verbosity_level" A..= verbosity_level_
        ]
