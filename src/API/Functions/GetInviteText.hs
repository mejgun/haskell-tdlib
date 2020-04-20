-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInviteText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetInviteText = 
 GetInviteText -- deriving (Show)

instance T.ToJSON GetInviteText where
 toJSON (GetInviteText {  }) =
  A.object [ "@type" A..= T.String "getInviteText" ]
-- getInviteText GetInviteText 

