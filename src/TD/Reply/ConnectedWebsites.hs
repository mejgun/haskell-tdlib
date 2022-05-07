{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ConnectedWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ConnectedWebsite as ConnectedWebsite
import qualified Utils as U

data ConnectedWebsites = -- | Contains a list of websites the current user is logged in with Telegram @websites List of connected websites
  ConnectedWebsites
  { -- |
    websites :: Maybe [ConnectedWebsite.ConnectedWebsite]
  }
  deriving (Eq)

instance Show ConnectedWebsites where
  show
    ConnectedWebsites
      { websites = websites
      } =
      "ConnectedWebsites"
        ++ U.cc
          [ U.p "websites" websites
          ]

instance T.FromJSON ConnectedWebsites where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "connectedWebsites" -> parseConnectedWebsites v
      _ -> fail ""
    where
      parseConnectedWebsites :: A.Value -> T.Parser ConnectedWebsites
      parseConnectedWebsites = A.withObject "ConnectedWebsites" $ \o -> do
        websites_ <- o A..:? "websites"
        return $ ConnectedWebsites {websites = websites_}
  parseJSON _ = fail ""

instance T.ToJSON ConnectedWebsites where
  toJSON
    ConnectedWebsites
      { websites = websites
      } =
      A.object
        [ "@type" A..= T.String "connectedWebsites",
          "websites" A..= websites
        ]
