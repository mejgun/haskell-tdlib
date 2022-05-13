{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.LogTags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data LogTags = -- | Contains a list of available TDLib internal log tags @tags List of log tags
  LogTags
  { -- |
    tags :: Maybe [String]
  }
  deriving (Eq)

instance Show LogTags where
  show
    LogTags
      { tags = tags_
      } =
      "LogTags"
        ++ U.cc
          [ U.p "tags" tags_
          ]

instance T.FromJSON LogTags where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "logTags" -> parseLogTags v
      _ -> mempty
    where
      parseLogTags :: A.Value -> T.Parser LogTags
      parseLogTags = A.withObject "LogTags" $ \o -> do
        tags_ <- o A..:? "tags"
        return $ LogTags {tags = tags_}
  parseJSON _ = mempty

instance T.ToJSON LogTags where
  toJSON
    LogTags
      { tags = tags_
      } =
      A.object
        [ "@type" A..= T.String "logTags",
          "tags" A..= tags_
        ]
