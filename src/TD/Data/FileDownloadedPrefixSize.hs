{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FileDownloadedPrefixSize where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data FileDownloadedPrefixSize = -- | Contains size of downloaded prefix of a file @size The prefix size, in bytes
  FileDownloadedPrefixSize
  { -- |
    size :: Maybe Int
  }
  deriving (Eq)

instance Show FileDownloadedPrefixSize where
  show
    FileDownloadedPrefixSize
      { size = size_
      } =
      "FileDownloadedPrefixSize"
        ++ U.cc
          [ U.p "size" size_
          ]

instance T.FromJSON FileDownloadedPrefixSize where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "fileDownloadedPrefixSize" -> parseFileDownloadedPrefixSize v
      _ -> mempty
    where
      parseFileDownloadedPrefixSize :: A.Value -> T.Parser FileDownloadedPrefixSize
      parseFileDownloadedPrefixSize = A.withObject "FileDownloadedPrefixSize" $ \o -> do
        size_ <- o A..:? "size"
        return $ FileDownloadedPrefixSize {size = size_}
  parseJSON _ = mempty

instance T.ToJSON FileDownloadedPrefixSize where
  toJSON
    FileDownloadedPrefixSize
      { size = size_
      } =
      A.object
        [ "@type" A..= T.String "fileDownloadedPrefixSize",
          "size" A..= size_
        ]
