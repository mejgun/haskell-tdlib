-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AddedReaction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Represents a reaction applied to a message 
-- 
-- __reaction__ Text representation of the reaction
-- 
-- __sender_id__ Identifier of the chat member, applied the reaction
data AddedReaction = 

 AddedReaction { sender_id :: Maybe MessageSender.MessageSender, reaction :: Maybe String }  deriving (Eq)

instance Show AddedReaction where
 show AddedReaction { sender_id=sender_id, reaction=reaction } =
  "AddedReaction" ++ cc [p "sender_id" sender_id, p "reaction" reaction ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AddedReaction where
 toJSON AddedReaction { sender_id = sender_id, reaction = reaction } =
  A.object [ "@type" A..= T.String "addedReaction", "sender_id" A..= sender_id, "reaction" A..= reaction ]

instance T.FromJSON AddedReaction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addedReaction" -> parseAddedReaction v
   _ -> mempty
  where
   parseAddedReaction :: A.Value -> T.Parser AddedReaction
   parseAddedReaction = A.withObject "AddedReaction" $ \o -> do
    sender_id <- o A..:? "sender_id"
    reaction <- o A..:? "reaction"
    return $ AddedReaction { sender_id = sender_id, reaction = reaction }
 parseJSON _ = mempty
