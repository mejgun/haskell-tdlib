{-# LANGUAGE OverloadedStrings #-}

module TD.Data.LogStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a stream to which TDLib internal log is written
data LogStream
  = -- | The log is written to stderr or an OS specific log
    LogStreamDefault
  | -- | The log is written to a file
    LogStreamFile
      { -- | Pass true to additionally redirect stderr to the log file. Ignored on Windows
        redirect_stderr :: Maybe Bool,
        -- | The maximum size of the file to where the internal TDLib log is written before the file will automatically be rotated, in bytes
        max_file_size :: Maybe Int,
        -- | Path to the file to where the internal TDLib log will be written
        path :: Maybe String
      }
  | -- | The log is written nowhere
    LogStreamEmpty
  deriving (Eq)

instance Show LogStream where
  show LogStreamDefault =
    "LogStreamDefault"
      ++ U.cc
        []
  show
    LogStreamFile
      { redirect_stderr = redirect_stderr,
        max_file_size = max_file_size,
        path = path
      } =
      "LogStreamFile"
        ++ U.cc
          [ U.p "redirect_stderr" redirect_stderr,
            U.p "max_file_size" max_file_size,
            U.p "path" path
          ]
  show LogStreamEmpty =
    "LogStreamEmpty"
      ++ U.cc
        []

instance T.FromJSON LogStream where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "logStreamDefault" -> parseLogStreamDefault v
      "logStreamFile" -> parseLogStreamFile v
      "logStreamEmpty" -> parseLogStreamEmpty v
      _ -> mempty
    where
      parseLogStreamDefault :: A.Value -> T.Parser LogStream
      parseLogStreamDefault = A.withObject "LogStreamDefault" $ \o -> do
        return $ LogStreamDefault {}

      parseLogStreamFile :: A.Value -> T.Parser LogStream
      parseLogStreamFile = A.withObject "LogStreamFile" $ \o -> do
        redirect_stderr_ <- o A..:? "redirect_stderr"
        max_file_size_ <- mconcat [o A..:? "max_file_size", U.rm <$> (o A..: "max_file_size" :: T.Parser String)] :: T.Parser (Maybe Int)
        path_ <- o A..:? "path"
        return $ LogStreamFile {redirect_stderr = redirect_stderr_, max_file_size = max_file_size_, path = path_}

      parseLogStreamEmpty :: A.Value -> T.Parser LogStream
      parseLogStreamEmpty = A.withObject "LogStreamEmpty" $ \o -> do
        return $ LogStreamEmpty {}
  parseJSON _ = mempty

instance T.ToJSON LogStream where
  toJSON LogStreamDefault =
    A.object
      [ "@type" A..= T.String "logStreamDefault"
      ]
  toJSON
    LogStreamFile
      { redirect_stderr = redirect_stderr,
        max_file_size = max_file_size,
        path = path
      } =
      A.object
        [ "@type" A..= T.String "logStreamFile",
          "redirect_stderr" A..= redirect_stderr,
          "max_file_size" A..= max_file_size,
          "path" A..= path
        ]
  toJSON LogStreamEmpty =
    A.object
      [ "@type" A..= T.String "logStreamEmpty"
      ]
