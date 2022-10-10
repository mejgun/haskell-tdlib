{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Files where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified Utils as U

-- |
data Files = -- | Represents a list of files @files List of files
  Files
  { -- |
    files :: Maybe [File.File]
  }
  deriving (Eq)

instance Show Files where
  show
    Files
      { files = files_
      } =
      "Files"
        ++ U.cc
          [ U.p "files" files_
          ]

instance T.FromJSON Files where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "files" -> parseFiles v
      _ -> mempty
    where
      parseFiles :: A.Value -> T.Parser Files
      parseFiles = A.withObject "Files" $ \o -> do
        files_ <- o A..:? "files"
        return $ Files {files = files_}
  parseJSON _ = mempty

instance T.ToJSON Files where
  toJSON
    Files
      { files = files_
      } =
      A.object
        [ "@type" A..= T.String "files",
          "files" A..= files_
        ]
