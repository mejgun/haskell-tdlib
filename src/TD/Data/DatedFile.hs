{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.DatedFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified Utils as U

-- |
data DatedFile = -- | File with the date it was uploaded @file The file @date Point in time (Unix timestamp) when the file was uploaded
  DatedFile
  { -- |
    date :: Maybe Int,
    -- |
    file :: Maybe File.File
  }
  deriving (Eq)

instance Show DatedFile where
  show
    DatedFile
      { date = date_,
        file = file_
      } =
      "DatedFile"
        ++ U.cc
          [ U.p "date" date_,
            U.p "file" file_
          ]

instance T.FromJSON DatedFile where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "datedFile" -> parseDatedFile v
      _ -> mempty
    where
      parseDatedFile :: A.Value -> T.Parser DatedFile
      parseDatedFile = A.withObject "DatedFile" $ \o -> do
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        file_ <- o A..:? "file"
        return $ DatedFile {date = date_, file = file_}
  parseJSON _ = mempty

instance T.ToJSON DatedFile where
  toJSON
    DatedFile
      { date = date_,
        file = file_
      } =
      A.object
        [ "@type" A..= T.String "datedFile",
          "date" A..= date_,
          "file" A..= file_
        ]
