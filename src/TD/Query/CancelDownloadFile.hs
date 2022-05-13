{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CancelDownloadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Stops the downloading of a file. If a file has already been downloaded, does nothing @file_id Identifier of a file to stop downloading @only_if_pending Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
data CancelDownloadFile = CancelDownloadFile
  { -- |
    only_if_pending :: Maybe Bool,
    -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show CancelDownloadFile where
  show
    CancelDownloadFile
      { only_if_pending = only_if_pending_,
        file_id = file_id_
      } =
      "CancelDownloadFile"
        ++ U.cc
          [ U.p "only_if_pending" only_if_pending_,
            U.p "file_id" file_id_
          ]

instance T.ToJSON CancelDownloadFile where
  toJSON
    CancelDownloadFile
      { only_if_pending = only_if_pending_,
        file_id = file_id_
      } =
      A.object
        [ "@type" A..= T.String "cancelDownloadFile",
          "only_if_pending" A..= only_if_pending_,
          "file_id" A..= file_id_
        ]
